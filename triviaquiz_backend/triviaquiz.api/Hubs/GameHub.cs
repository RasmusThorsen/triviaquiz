using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using triviaquiz.api.Data;
using triviaquiz.api.Data.Repositories;
using triviaquiz.api.Models;
using triviaquiz.api.Models.ViewModels;
using triviaquiz.api.Services;

namespace triviaquiz.api.Hubs
{
    public class GameHub : Hub<IClientHub>
    {
        private ILobbyRepository _lobbyRepo;
        private IOpenTriviaDb _otdb;
        public GameHub(ILobbyRepository lobbyRepo, IOpenTriviaDb otdb)
        {
            _lobbyRepo = lobbyRepo;
            _otdb = otdb;
        }

        public async Task<LobbyViewModel> Create(CreateLobbyViewModel model)
        {
            // TODO: Delete the following
            model.GameModeId = "56f2133e-d59d-4871-832f-f4f86835d6df";

            // define host player
            var host = new Player
            {
                Name = model.HostUsername,
                IsHost = true,
                ConnectionId = Context.ConnectionId
            };

            // define the lobby
            var lobby = new Lobby
            {
                GameCode = await GenerateGameCode(),
                GameMode = await _lobbyRepo.GetGameMode(model.GameModeId)
            };

            // setup the categories
            string[] difficulties = {"easy", "medium", "hard"};
            foreach (var modelCategory in model.Categories)
            {
                var category = new Category {Name = modelCategory.Name};
                for (int i = 0; i < difficulties.Length; i++)
                {
                    category.Questions.AddRange(await _otdb.GetQuestions(modelCategory.Id, 2, difficulties[i]));
                }
                lobby.Categories.Add(category);
            }

            // create and return the lobby
            return await _lobbyRepo.CreateLobby(lobby, host);
        }

        public async Task<LobbyViewModel> Connect(ConnectInputViewModel model)
        {
            if (model == null) return null;

            // check if any lobbies exists with the given gamecode
            var lobbyId = await _lobbyRepo.ExistsWithCode(model.GameCode);
            if (lobbyId == null) return null;

            // add the player to the lobby
            var player = new Player { IsHost = false, ConnectionId = Context.ConnectionId, Name = model.Username };
            await _lobbyRepo.AddPlayer(lobbyId, player);

            // get the lobby
            var lobby = await _lobbyRepo.GetLobby(lobbyId);

            // notify the players inside the lobby about the newly connected user
            var connections = await _lobbyRepo.GetPlayerConnectionIds(lobbyId);
            var players = lobby.Players;
            await Clients.Clients(connections.Where(c => c != Context.ConnectionId).ToList())
                .UserConnected(new UserConnectedViewModel { ConnectedUsers = players, LobbyId = lobby.Id });

            // return lobby
            return lobby;
        }

        #region helper functions
        private async Task<string> GenerateGameCode()
        {
            var found = false;
            var code = "";
            string pool = "ABCDEFGHIKLMNOPQRSTVXYZ1234567890";
            int gamecodeLength = 4;

            while (!found)
            {
                code = GenerateRandomString(pool, gamecodeLength);
                if (await _lobbyRepo.ExistsWithCode(code) == null) found = true;
            }

            return code;
        }

        private string GenerateRandomString(string pool, int length)
        {
            var rnd = new Random();
            var builder = new StringBuilder();
            for (int i = 0; i < length; i++)
            {
                var c = pool[rnd.Next(0, pool.Length)];
                builder.Append(c);
            }
            return builder.ToString();
        }


        #endregion
        
    }

    public interface IClientHub
    {
        Task UserConnected(UserConnectedViewModel model);
    }
}
