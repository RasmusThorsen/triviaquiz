using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using triviaquiz.api.Data;
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

        public LobbyController(
            ApplicationDbContext context,
            IOpenTriviaDb otdb)
        {
            _context = context;
            _otdb = otdb;
        }

        [HttpGet("categories")]
        public async Task<List<OtdbCategory>> GetCategories()

        {
            return await _otdb.GetCategories();
        }

        [HttpGet("gamemodes")]
        public async Task<List<GameMode>> GetGameModes()
        {
            return await _context.GameModes
                .Select(g => g)
                .ToListAsync();
        }

        [HttpGet("test")]
        public async Task<LobbyViewModel> GetQuestions()
        {
            OtdbCategory[] categories =
            {
                new OtdbCategory() {Id = 20, Name = "Test 1"},
                new OtdbCategory() {Id = 21, Name = "Test 2"},
                new OtdbCategory() {Id = 22, Name = "Test 3"},
                new OtdbCategory() {Id = 23, Name = "Test 4"},
                new OtdbCategory() {Id = 24, Name = "Test 5"},
            };
            string[] difficulties = {"easy", "medium", "hard"};

            // create lobby
            var lobby = new LobbyViewModel()
            {
                GameCode = "GHJ2",
                GameMode = _context.GameModes.First()
            };

            foreach (var category in categories)
            {
                var categoryEntity = new Category(){Name = category.Name}; 
                for (int i = 0; i < difficulties.Length; i++)
                {
                    categoryEntity.Questions.AddRange(await _otdb.GetQuestions(category.Id, 2, difficulties[i]));
                }
                lobby.Categories.Add(categoryEntity);
            }
            return lobby;
        }

    }
}