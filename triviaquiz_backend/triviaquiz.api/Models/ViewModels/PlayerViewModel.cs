using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models.ViewModels
{
    public class PlayerViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool IsHost { get; set; }
    }
}
