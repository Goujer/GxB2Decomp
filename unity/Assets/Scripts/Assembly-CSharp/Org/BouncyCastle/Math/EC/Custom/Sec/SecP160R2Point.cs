namespace Org.BouncyCastle.Math.EC.Custom.Sec
{
	internal class SecP160R2Point : AbstractFpPoint
	{
		public SecP160R2Point(ECCurve curve, ECFieldElement x, ECFieldElement y)
			: base(null, null, null, false)
		{
		}

		public SecP160R2Point(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		internal SecP160R2Point(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
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

		public override ECPoint ThreeTimes()
		{
			return null;
		}

		public override ECPoint Negate()
		{
			return null;
		}
	}
}
