using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models
{
    public class Player
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ConnectionId { get; set; }
        public bool IsHost { get; set; } = false;
    }

    public class PlayerViewModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string IsHost { get; set; }
    }
}
