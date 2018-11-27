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

        LobbyRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task CreateLobby(LobbyViewModel model)
        {
            if (model == null) return;

            var lobby = new Lobby
            {
                Categories = model.Categories,
                GameMode = model.GameMode,
                GameCode = model.GameCode
            };

            await _context.Lobbies.AddAsync(lobby);
        }

        public async Task<bool> ExistsWithCode(string gameCode)
        {
            return await _context.Lobbies.AnyAsync(l => l.GameCode == gameCode);
        }

    }
}
