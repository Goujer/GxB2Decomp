namespace Org.BouncyCastle.Math.EC
{
	public abstract class AbstractFpPoint : ECPointBase
	{
		protected internal override bool CompressionYTilde
		{
			get
			{
				return false;
			}
		}

		protected AbstractFpPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		protected AbstractFpPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
			: base(null, null, null, false)
		{
		}

		protected override bool SatisfiesCurveEquation()
		{
			return false;
		}

		public override ECPoint Subtract(ECPoint b)
		{
			return null;
		}
	}
}
