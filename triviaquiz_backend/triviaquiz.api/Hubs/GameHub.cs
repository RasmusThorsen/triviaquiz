using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using triviaquiz.api.Data;
using triviaquiz.api.Data.Repositories;
using triviaquiz.api.Models.ViewModels;

namespace triviaquiz.api.Hubs
{
    public class GameHub : Hub<IClientHub>
    {
        private ILobbyRepository _lobbyRepo;
        public GameHub(ILobbyRepository lobbyRepo)
        {
            _lobbyRepo = lobbyRepo;
        }

        public async Task Create(CreateLobbyViewModel model)
        {
            var lobby = new LobbyViewModel();

            //  generate the game code
            var gameCode = GenerateGameCode();

            await _lobbyRepo.CreateLobby(lobby);
        }


        private async Task<string> GenerateGameCode()
        {
            var found = false;
            var code = "";
            string pool = "ABCDEFGHIKLMNOPQRSTVXYZ1234567890";
            int gamecodeLength = 4;

            while (!found)
            {
                code = GenerateRandomString(pool, gamecodeLength);
                if (!await _lobbyRepo.ExistsWithCode(code)) found = true;
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
    }

    public interface IClientHub
    {
        Task Create(CreateLobbyViewModel model);
    }
}
