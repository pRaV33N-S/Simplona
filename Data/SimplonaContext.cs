using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Simplona.Models;

namespace Simplona.Data
{
    public class SimplonaContext : DbContext
    {
        public SimplonaContext (DbContextOptions<SimplonaContext> options)
            : base(options)
        {
        }

        public DbSet<Simplona.Models.DeptMaster> DeptMaster { get; set; } = default!;

        public DbSet<Simplona.Models.EmpProfile>? EmpProfile { get; set; }
    }
}
