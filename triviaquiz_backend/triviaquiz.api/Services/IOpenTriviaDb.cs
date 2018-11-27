using System.Collections.Generic;
using System.Threading.Tasks;
using triviaquiz.api.Models;
using triviaquiz.api.Models.Otdb;

namespace triviaquiz.api.Services
{
    public interface IOpenTriviaDb
    {
        Task<List<OtdbCategory>> GetCategories();
        Task<List<Question>> GetQuestions(int category, int amount, string difficulty);
    }
}
