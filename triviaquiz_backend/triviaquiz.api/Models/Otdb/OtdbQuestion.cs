using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models.Otdb
{
    public class OtdbQuestion
    {
        public string Category { get; set; }
        public string Type { get; set; }
        public string Difficulty { get; set; }
        public string Question { get; set; }
        public string Correct_Answer { get; set; }
        public List<string> Incorrect_Answers { get; set; }
    }

    public class OtdbQuestionsResponse
    {
        public int Response_Code { get; set; }
        public List<OtdbQuestion> Results { get; set; }
    }
}
