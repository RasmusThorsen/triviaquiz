using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models
{
    public class Question
    {
        public string Id { get; set; }
        public QuestionType Type { get; set; }
        public QuestionDifficulty Difficulty { get; set; }
        public string Value { get; set; }
        public string CorrectAnswer { get; set; }
        public Category Category { get; set; }

        private string _incorrectAnswers;
        private static readonly char delimiter = ';';
        [NotMapped]
        public List<string> IncorrectAnswers
        {
            get { return _incorrectAnswers.Split(delimiter).ToList(); }
            set { _incorrectAnswers = string.Join($"{delimiter}", value); }
        }
    }

    public enum QuestionType
    {
        Boolean,
        Multiple
    }

    public enum QuestionDifficulty
    {
        Easy,
        Medium,
        Hard
    }
}
