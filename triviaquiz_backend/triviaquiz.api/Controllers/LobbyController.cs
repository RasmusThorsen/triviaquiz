using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
        public async Task<List<string>> GetQuestions()
        {
            return new List<string>{"The", "API", "Works!"};
        }

    }
}