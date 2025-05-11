namespace Org.BouncyCastle.Math.EC.Custom.Sec
{
	internal class SecT233K1Point : AbstractF2mPoint
	{
		public override ECFieldElement YCoord
		{
			get
			{
				return null;
			}
		}

		protected internal override bool CompressionYTilde
		{
			get
			{
				return false;
			}
		}

		public SecT233K1Point(ECCurve curve, ECFieldElement x, ECFieldElement y)
			: base(null, null, null, false)
		{
		}

		public SecT233K1Point(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		internal SecT233K1Point(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
			: base(null, null, null, false)
		{
		}

		protected override ECPoint Detach()
		{
			return null;
		}

		public override ECPoint Add(ECPoint b)
		{
			return null;
		}

		public override ECPoint Twice()
		{
			return null;
		}

		public override ECPoint TwicePlus(ECPoint b)
		{
			return null;
		}

		public override ECPoint Negate()
		{
			return null;
		}
	}
}
