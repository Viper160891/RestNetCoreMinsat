using System;
using System.Collections.Generic;
using System.Text;

namespace Minsair.Models
{
    public class Clientes
    {
        public int Id { get; set; }
        public string strIdentificadorFiscal { get; set; }
        public string strEmail { get; set; }
        public int idPais { get; set; }
        public int idRazonSocial { get; set; }
        public string strNombre { get; set; }
    }
}
