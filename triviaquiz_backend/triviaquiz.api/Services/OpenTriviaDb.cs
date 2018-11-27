using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using triviaquiz.api.Models;
using triviaquiz.api.Models.Otdb;

namespace triviaquiz.api.Services
{
    public class OpenTriviaDb : IOpenTriviaDb
    {

        public async Task<List<OtdbCategory>> GetCategories()
        {
            string endpoint = "https://opentdb.com/api_category.php";
            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetAsync(endpoint);
                if (response.IsSuccessStatusCode)
                {
                    var result = await response.Content.ReadAsAsync<OtdbCategoriesResponse>();
                    return result.trivia_categories;
                }
                return null;
            }
        }

        public async Task<List<Question>> GetQuestions(int category, int amount, string difficulty)
        {
            string endpoint = $"https://opentdb.com/api.php?amount={amount}&category={category}&difficulty={difficulty}";
            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetAsync(endpoint);
                if (response.IsSuccessStatusCode)
                {
                    var otdbReponse = await response.Content.ReadAsAsync<OtdbQuestionsResponse>();
                    var otdbQuestions = otdbReponse.Results;

                    List<Question> result = new List<Question>();
                    foreach (var question in otdbQuestions)
                    {
                        result.Add(new Question
                        {
                            CorrectAnswer = WebUtility.HtmlDecode(question.Correct_Answer),
                            Value = WebUtility.HtmlDecode(question.Question),
                            IncorrectAnswers = question.Incorrect_Answers
                                .Select(ia => WebUtility.HtmlDecode(ia)).ToList(),
                            Type = GetType(question.Type),
                            Difficulty = GetDifficulty(question.Difficulty)
                        });
                    }
                    return result;
                }
                return null;
            }
        }

        private QuestionType GetType(string type)
        {
            if (type == "multiple") return QuestionType.Multiple;
            else if (type == "boolean") return QuestionType.Boolean;

            // default
            return QuestionType.Multiple;
        }

        private QuestionDifficulty GetDifficulty(string difficulty)
        {
            if (difficulty == "easy") return QuestionDifficulty.Easy;
            else if (difficulty == "medium") return QuestionDifficulty.Medium;
            else if (difficulty == "hard") return QuestionDifficulty.Hard;
            // default
            return QuestionDifficulty.Easy;
        }
    }
}
