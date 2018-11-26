using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models
{
    public class OtdbCategory
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class OtdbCategoriesResponse
    {
        public List<OtdbCategory> trivia_categories { get; set; }
    }
}
