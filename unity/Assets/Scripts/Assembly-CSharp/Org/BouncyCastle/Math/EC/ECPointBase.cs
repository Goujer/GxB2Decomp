namespace Org.BouncyCastle.Math.EC
{
	public abstract class ECPointBase : ECPoint
	{
		protected internal ECPointBase(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		protected internal ECPointBase(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
			: base(null, null, null, false)
		{
		}

		public override byte[] GetEncoded(bool compressed)
		{
			return null;
		}

		public override ECPoint Multiply(BigInteger k)
		{
			return null;
		}
	}
}
