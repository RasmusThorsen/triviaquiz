using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models.ViewModels
{
    public class UserConnectedViewModel
    {
        public string LobbyId { get; set; }
        public List<string> ConnectedUsers { get; set; }
    }
}
