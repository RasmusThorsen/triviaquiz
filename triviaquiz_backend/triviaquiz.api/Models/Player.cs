namespace triviaquiz.api.Models
{
    public class Player
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ConnectionId { get; set; }
        public bool IsHost { get; set; } = false;
        public Lobby Lobby { get; set; }
    }
}
