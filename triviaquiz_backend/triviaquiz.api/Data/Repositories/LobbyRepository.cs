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

        public async Task<LobbyViewModel> CreateLobby(LobbyViewModel model, Player host)
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

            // success // TODO: Convert lobby to viewmodel
            return null;
        }

        public async Task DeleteLobby(string lobbyId)
        {
            if (lobbyId == null) return;

            var lobby = await _context.Lobbies.SingleOrDefaultAsync(l => l.Id == lobbyId);
            _context.Lobbies.Remove(lobby);

            await _context.SaveChangesAsync();
        }

        public async Task<bool> ExistsWithCode(string gameCode)
        {
            return await _context.Lobbies.AnyAsync(l => l.GameCode == gameCode);
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
    }
}
