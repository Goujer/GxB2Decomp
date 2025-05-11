using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1
{
	public class DerEnumerated : Asn1Object
	{
		private readonly byte[] bytes;

		private static readonly DerEnumerated[] cache;

		public BigInteger Value
		{
			get
			{
				return null;
			}
		}

		public DerEnumerated(int val)
		{
		}

		public DerEnumerated(BigInteger val)
		{
		}

		public DerEnumerated(byte[] bytes)
		{
		}

		public static DerEnumerated GetInstance(object obj)
		{
			return null;
		}

		public static DerEnumerated GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		internal override void Encode(DerOutputStream derOut)
		{
		}

		protected override bool Asn1Equals(Asn1Object asn1Object)
		{
			return false;
		}

		protected override int Asn1GetHashCode()
		{
			return 0;
		}

		internal static DerEnumerated FromOctetString(byte[] enc)
		{
			return null;
		}
	}
}
