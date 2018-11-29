using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models.ViewModels
{
    public class CategoryViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public List<QuestionViewModel> Questions { get; set; } = new List<QuestionViewModel>();
    }
}
