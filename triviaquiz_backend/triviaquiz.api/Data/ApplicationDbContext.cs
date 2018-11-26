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

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Question>()
                .Property<string>("IncorrectAnswersCollection")
                .HasField("_incorrectAnswers");
        }
    }
}
