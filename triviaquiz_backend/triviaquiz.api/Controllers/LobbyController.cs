using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using triviaquiz.api.Data;
using triviaquiz.api.Data.Repositories;
using triviaquiz.api.Models;
using triviaquiz.api.Models.Otdb;
using triviaquiz.api.Models.ViewModels;
using triviaquiz.api.Services;

namespace triviaquiz.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LobbyController : ControllerBase
    {
        private ApplicationDbContext _context;
        private IOpenTriviaDb _otdb;
        private ILobbyRepository _lobbyRepo;

        public LobbyController(
            ApplicationDbContext context,
            IOpenTriviaDb otdb,
            ILobbyRepository lobbyRepo)
        {
            _context = context;
            _otdb = otdb;
            _lobbyRepo = lobbyRepo;
        }

        [HttpGet("categories")]
        public async Task<List<OtdbCategory>> GetCategories()

        {
            return await _otdb.GetCategories();
        }

        [HttpGet("gamemodes")]
        public async Task<List<GameMode>> GetGameModes()
        {
            return await _lobbyRepo.GetGameModes();
        }

        [HttpGet("test")]
        public async Task<LobbyViewModel> GetQuestions()
        {
            var model = new CreateLobbyViewModel
            {
                HostUsername = "Jakob",
                GameModeId = "56f2133e-d59d-4871-832f-f4f86835d6df",
                Categories = new List<OtdbCategory>
                {
                    new OtdbCategory
                    {
                        Id = 21,
                        Name = "Sport"
                    }
                }
            };

            // define host player
            var host = new Player
            {
                Name = model.HostUsername,
                IsHost = true,
                ConnectionId = "123456789"
            };

            // define the lobby
            var lobby = new Lobby
            {
                GameCode = await GenerateGameCode(),
                GameMode = await _lobbyRepo.GetGameMode(model.GameModeId)
            };

            // setup the categories
            string[] difficulties = { "easy", "medium", "hard" };
            foreach (var modelCategory in model.Categories)
            {
                var category = new Category { Name = modelCategory.Name };
                for (int i = 0; i < difficulties.Length; i++)
                {
                    category.Questions.AddRange(await _otdb.GetQuestions(modelCategory.Id, 2, difficulties[i]));
                }
                lobby.Categories.Add(category);
            }

            // create and return the lobby
            return await _lobbyRepo.CreateLobby(lobby, host);
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

    }
}