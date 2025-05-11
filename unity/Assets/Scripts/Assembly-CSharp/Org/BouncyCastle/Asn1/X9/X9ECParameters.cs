using Org.BouncyCastle.Math;
using Org.BouncyCastle.Math.EC;

namespace Org.BouncyCastle.Asn1.X9
{
	public class X9ECParameters : Asn1Encodable
	{
		private X9FieldID fieldID;

		private ECCurve curve;

		private X9ECPoint g;

		private BigInteger n;

		private BigInteger h;

		private byte[] seed;

		public ECCurve Curve
		{
			get
			{
				return null;
			}
		}

		public ECPoint G
		{
			get
			{
				return null;
			}
		}

		public BigInteger N
		{
			get
			{
				return null;
			}
		}

		public BigInteger H
		{
			get
			{
				return null;
			}
		}

		public X9Curve CurveEntry
		{
			get
			{
				return null;
			}
		}

		public X9FieldID FieldIDEntry
		{
			get
			{
				return null;
			}
		}

		public X9ECPoint BaseEntry
		{
			get
			{
				return null;
			}
		}

		public X9ECParameters(Asn1Sequence seq)
		{
		}

		public X9ECParameters(ECCurve curve, ECPoint g, BigInteger n)
		{
		}

		public X9ECParameters(ECCurve curve, X9ECPoint g, BigInteger n, BigInteger h)
		{
		}

		public X9ECParameters(ECCurve curve, ECPoint g, BigInteger n, BigInteger h)
		{
		}

		public X9ECParameters(ECCurve curve, ECPoint g, BigInteger n, BigInteger h, byte[] seed)
		{
		}

		public X9ECParameters(ECCurve curve, X9ECPoint g, BigInteger n, BigInteger h, byte[] seed)
		{
		}

		public static X9ECParameters GetInstance(object obj)
		{
			return null;
		}

		public byte[] GetSeed()
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
