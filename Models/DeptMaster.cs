using System.ComponentModel.DataAnnotations;

namespace Simplona.Models
{
    public class DeptMaster
    {
        [Key]
        public int DeptCode { get; set; }
        public string DeptName { get; set; }
        public virtual ICollection<EmpProfile> empProfiles { get; set; }
    }
}
