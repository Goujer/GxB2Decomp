namespace Org.BouncyCastle.Math.EC.Custom.Sec
{
	internal class SecP384R1Curve : AbstractFpCurve
	{
		public static readonly BigInteger q;

		private const int SecP384R1_DEFAULT_COORDS = 2;

		protected readonly SecP384R1Point m_infinity;

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

		public SecP384R1Curve()
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
