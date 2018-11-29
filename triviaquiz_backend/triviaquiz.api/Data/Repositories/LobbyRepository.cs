using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using triviaquiz.api.Models;
using triviaquiz.api.Models.ViewModels;

namespace triviaquiz.api.Data.Repositories
{
    public class LobbyRepository : ILobbyRepository
    {
        private ApplicationDbContext _context;

        public LobbyRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<LobbyViewModel> CreateLobby(Lobby model, Player host)
        {
            if (model == null) return null;

            // initiate the lobby
            var lobby = new Lobby
            {
                Categories = model.Categories,
                GameMode = model.GameMode,
                GameCode = model.GameCode
            };
            // add the host
            lobby.Players.Add(host);

            // add and save
            await _context.Lobbies.AddAsync(lobby);
            await _context.SaveChangesAsync();

            // success -- return the lobby
            var vm = BuildViewModel(lobby);
            return vm;
        }

        public async Task DeleteLobby(string lobbyId)
        {
            if (lobbyId == null) return;

            var lobby = await _context.Lobbies.SingleOrDefaultAsync(l => l.Id == lobbyId);
            _context.Lobbies.Remove(lobby);

            await _context.SaveChangesAsync();
        }

        public async Task<string> ExistsWithCode(string gameCode)
        {
            return await _context.Lobbies
                .Where(l => l.GameCode == gameCode)
                .Select(l => l.Id)
                .SingleOrDefaultAsync();
        }

        public async Task<GameMode> GetGameMode(string gamemodeId)
        {
            return await _context.GameModes
                .SingleOrDefaultAsync(g => g.Id == gamemodeId);
        }

        public async Task<List<GameMode>> GetGameModes()
        {
            return await _context.GameModes
                .Select(g => g)
                .ToListAsync();
        }

        public async Task<LobbyViewModel> GetLobby(string lobbyId)
        {
            // get the lobby
            var lobby = await _context.Lobbies
                .Include(l => l.Players)
                .Include(l => l.GameMode)
                .Include(l => l.Categories)
                    .ThenInclude(c => c.Questions)
                .SingleOrDefaultAsync(l => l.Id == lobbyId);
            if (lobby == null) return null;

            return BuildViewModel(lobby);
        }

        public async Task AddPlayer(string lobbyId, Player player)
        {
            // get the lobby
            var lobby = await _context.Lobbies
                .Include(l => l.Players)
                .SingleOrDefaultAsync(l => l.Id == lobbyId);
            if (lobby == null) return;

            // add the player
            lobby.Players.Add(player);

            await _context.SaveChangesAsync();
        }
        public async Task<List<string>> GetPlayerConnectionIds(string lobbyId)
        {
            // get lobby
            var lobby = await _context.Lobbies
                .Include(l => l.Players)
                .SingleOrDefaultAsync(l => l.Id == lobbyId);

            if (lobby == null) return null;

            // return connection ids
            return lobby.Players.Select(p => p.ConnectionId).ToList();
        }

        private LobbyViewModel BuildViewModel(Lobby lobby)
        {
            return new LobbyViewModel
            {
                Id = lobby.Id,
                Categories = lobby.Categories.Select(c => new CategoryViewModel()
                {
                    Id = c.Id,
                    Name = c.Name,
                    Questions = c.Questions.Select(q => new QuestionViewModel
                    {
                        Id = q.Id,
                        Value = q.Value,
                        CorrectAnswer = q.CorrectAnswer,
                        Difficulty = q.Difficulty,
                        Type = q.Type,
                        IncorrectAnswers = q.IncorrectAnswers
                    }).ToList()
                }).ToList(),
                GameCode = lobby.GameCode,
                GameMode = lobby.GameMode.Name,
                Players = lobby.Players.Select(p => new PlayerViewModel
                {
                    Id = p.Id,
                    IsHost = p.IsHost,
                    Name = p.Name
                }).ToList(),
            };
        }

        
    }
}
