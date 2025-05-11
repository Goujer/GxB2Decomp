using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.CryptoPro
{
	public class Gost3410ParamSetParameters : Asn1Encodable
	{
		private readonly int keySize;

		private readonly DerInteger p;

		private readonly DerInteger q;

		private readonly DerInteger a;

		public int KeySize
		{
			get
			{
				return 0;
			}
		}

		public BigInteger P
		{
			get
			{
				return null;
			}
		}

		public BigInteger Q
		{
			get
			{
				return null;
			}
		}

		public BigInteger A
		{
			get
			{
				return null;
			}
		}

		public Gost3410ParamSetParameters(int keySize, BigInteger p, BigInteger q, BigInteger a)
		{
		}

		private Gost3410ParamSetParameters(Asn1Sequence seq)
		{
		}

		public static Gost3410ParamSetParameters GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static Gost3410ParamSetParameters GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
