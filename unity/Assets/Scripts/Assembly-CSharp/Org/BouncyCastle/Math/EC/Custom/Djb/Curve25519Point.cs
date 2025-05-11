namespace Org.BouncyCastle.Math.EC.Custom.Djb
{
	internal class Curve25519Point : AbstractFpPoint
	{
		public Curve25519Point(ECCurve curve, ECFieldElement x, ECFieldElement y)
			: base(null, null, null, false)
		{
		}

		public Curve25519Point(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		internal Curve25519Point(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
			: base(null, null, null, false)
		{
		}

		protected override ECPoint Detach()
		{
			return null;
		}

		public override ECFieldElement GetZCoord(int index)
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

		protected virtual Curve25519FieldElement CalculateJacobianModifiedW(Curve25519FieldElement Z, uint[] ZSquared)
		{
			return null;
		}

		protected virtual Curve25519FieldElement GetJacobianModifiedW()
		{
			return null;
		}

		protected virtual Curve25519Point TwiceJacobianModified(bool calculateW)
		{
			return null;
		}
	}
}
