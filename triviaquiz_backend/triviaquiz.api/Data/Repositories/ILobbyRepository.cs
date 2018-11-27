using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using triviaquiz.api.Models.ViewModels;

namespace triviaquiz.api.Data.Repositories
{
    public interface ILobbyRepository
    {
        Task CreateLobby(LobbyViewModel model);
        Task<bool> ExistsWithCode(string gameCode);
    }
}
