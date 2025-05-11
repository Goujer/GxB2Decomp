using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.X509
{
	public class CrlNumber : DerInteger
	{
		public BigInteger Number
		{
			get
			{
				return null;
			}
		}

		public CrlNumber(BigInteger number)
			: base(0)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
