﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using triviaquiz.api.Models;
using triviaquiz.api.Models.ViewModels;

namespace triviaquiz.api.Data.Repositories
{
    public interface ILobbyRepository
    {
        Task<LobbyViewModel> CreateLobby(LobbyViewModel model, Player host);
        Task<string> ExistsWithCode(string gameCode);
        Task<GameMode> GetGameMode(string gamemodeId);
        Task DeleteLobby(string lobbyId);
        Task<List<GameMode>> GetGameModes();
        Task<LobbyViewModel> GetLobby(string lobbyId);
        Task AddPlayer(string lobbyId, Player player);

    }
}
