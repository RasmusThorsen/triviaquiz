using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using triviaquiz.api.Models;

namespace triviaquiz.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LobbyController : ControllerBase
    {
        [HttpGet("categories")]
        public async Task<List<OtdbCategory>> GetCategories()

        {
            return await FetchCategories();
        }

        private async Task<List<OtdbCategory>> FetchCategories()
        {
            string endpoint = "https://opentdb.com/api_category.php";
            HttpClient client = new HttpClient();

            HttpResponseMessage response = await client.GetAsync(endpoint);
            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadAsAsync<OtdbCategoriesResponse>();
                return result.trivia_categories;
            }

            return null;
        }
    }
}