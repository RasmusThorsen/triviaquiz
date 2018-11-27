using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using triviaquiz.api.Models.Otdb;

namespace triviaquiz.api.Models.ViewModels
{
    public class CreateLobbyViewModel
    {
        public string HostUsername { get; set; }
        public string GameModeId { get; set; }
        public List<OtdbCategory> Categories { get; set; }
    }
}
