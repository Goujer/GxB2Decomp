using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1
{
	public class DerInteger : Asn1Object
	{
		private readonly byte[] bytes;

		public BigInteger Value
		{
			get
			{
				return null;
			}
		}

		public BigInteger PositiveValue
		{
			get
			{
				return null;
			}
		}

		public DerInteger(int value)
		{
		}

		public DerInteger(BigInteger value)
		{
		}

		public DerInteger(byte[] bytes)
		{
		}

		public static DerInteger GetInstance(object obj)
		{
			return null;
		}

		public static DerInteger GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}

		protected override int Asn1GetHashCode()
		{
			return 0;
		}

		protected override bool Asn1Equals(Asn1Object asn1Object)
		{
			return false;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
