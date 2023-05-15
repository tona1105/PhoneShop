using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Apifood.Database;
using Apifood.Models;

namespace Apifood.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly DemoDbContext _context;

        public ProductsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: api/products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<product>>> GetProduct()
        {
            return await _context.product.ToListAsync();
        }

        // GET: api/products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<product>> GetProduct(int id)
        {
            var product = await _context.product.FindAsync(id);

            if (product == null)
            {
                return NotFound();
            }

            return product;
        }

     

        // Edit 
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProdcut(int id, product product)
        {
            if (id != product.productid)
            {
                return BadRequest();
            }

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!productExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        // lấy product theo danh mục
        [HttpGet("viaCateId")]
        public async Task<ActionResult<IEnumerable<product>>> GetviaCateId([FromQuery] string MenuId)
        {

            var tmp = int.Parse(MenuId);
            var data = from p in _context.product
                       where (p.menuid == tmp)
                       select (p);
            return await data.ToListAsync();
        }

        // lấy sản phẩm nổi bật
        [HttpGet("OutstandingProduct")]
        public async Task<ActionResult<IEnumerable<product>>> GetOutstandingFood([FromQuery] string typeProduct)
        {

            var tmp = int.Parse(typeProduct);
            var data = from p in _context.product
                       where (p.typeProduct == tmp)
                       select (p);
            return await data.ToListAsync();
        }



        [Route("search/{nameData}")]
        [HttpGet]
        public async Task<IActionResult> GetProductsByName(string nameData)
        {
            
                        var items = await _context.product
                            .Where(x => x.productname.Contains(nameData))
                            .ToListAsync();
                        if(items == null)
            {
                        await _context.product.ToListAsync();
            }
                        return Ok(items);
                        
        }

        // POST: api/foods
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<product>> AddProduct([FromBody] ProductAddModels Model)
        {
            if (ModelState.IsValid)
            {
                var product = new product()
                {
                    productname = Model.productname,
                    menuid = Model.menuid,
                    price = Model.price,
                    imghp = Model.imghp,
                    img1 = Model.img1,
                    img2 = Model.img2,
                    img3 = Model.img3,
                    img4 = Model.img4,
                    productDescription = Model.productDescription,
                    inStock = Model.inStock,
                    typeProduct = Model.typeProduct,


                };

                _context.product.Add(product);
                await _context.SaveChangesAsync();
                return Ok(product);
            }

            return BadRequest(ModelState.Values);
        }




        // Xóa
        // DELETE: api/foods/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var product = await _context.product.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.product.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool productExists(int id)
        {
            return _context.product.Any(e => e.productid == id);
        }
    }
}
