using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGeneration.EntityFrameworkCore;
using triviaquiz.api.Models;

namespace triviaquiz.api.Data
{
    public class ApplicationDbContext : DbContext
    {
        public DbSet<Lobby> Lobbies { get; set; }
        public DbSet<Player> Players { get; set; }
        public DbSet<GameMode> GameModes { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Question>()
                .Property<string>("IncorrectAnswersCollection")
                .HasField("_incorrectAnswers");

            modelBuilder.Entity<GameMode>().HasData(
                new GameMode { Id = "56f2133e-d59d-4871-832f-f4f86835d6df", Name = "Drinking Game"},
                new GameMode { Id = "ae3476ce-d55f-42e9-bdbf-564ab27e0338", Name = "Classic"}
            );
        }
    }
}
