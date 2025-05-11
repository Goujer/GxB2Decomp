namespace Org.BouncyCastle.Math.EC.Custom.Djb
{
	internal class Curve25519 : AbstractFpCurve
	{
		public static readonly BigInteger q;

		private const int Curve25519_DEFAULT_COORDS = 4;

		protected readonly Curve25519Point m_infinity;

		public virtual BigInteger Q
		{
			get
			{
				return null;
			}
		}

		public override ECPoint Infinity
		{
			get
			{
				return null;
			}
		}

		public override int FieldSize
		{
			get
			{
				return 0;
			}
		}

		public Curve25519()
			: base(null)
		{
		}

		protected override ECCurve CloneCurve()
		{
			return null;
		}

		public override bool SupportsCoordinateSystem(int coord)
		{
			return false;
		}

		public override ECFieldElement FromBigInteger(BigInteger x)
		{
			return null;
		}

		protected internal override ECPoint CreateRawPoint(ECFieldElement x, ECFieldElement y, bool withCompression)
		{
			return null;
		}

		protected internal override ECPoint CreateRawPoint(ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
		{
			return null;
		}
	}
}
