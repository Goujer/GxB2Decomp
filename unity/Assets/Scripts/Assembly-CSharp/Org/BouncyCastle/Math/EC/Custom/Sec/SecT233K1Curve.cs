using Org.BouncyCastle.Math.EC.Multiplier;

namespace Org.BouncyCastle.Math.EC.Custom.Sec
{
	internal class SecT233K1Curve : AbstractF2mCurve
	{
		private const int SecT233K1_DEFAULT_COORDS = 6;

		protected readonly SecT233K1Point m_infinity;

		public override int FieldSize
		{
			get
			{
				return 0;
			}
		}

		public override ECPoint Infinity
		{
			get
			{
				return null;
			}
		}

		public override bool IsKoblitz
		{
			get
			{
				return false;
			}
		}

		public virtual int M
		{
			get
			{
				return 0;
			}
		}

		public virtual bool IsTrinomial
		{
			get
			{
				return false;
			}
		}

		public virtual int K1
		{
			get
			{
				return 0;
			}
		}

		public virtual int K2
		{
			get
			{
				return 0;
			}
		}

		public virtual int K3
		{
			get
			{
				return 0;
			}
		}

		public SecT233K1Curve()
			: base(0, 0, 0, 0)
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

		protected override ECMultiplier CreateDefaultMultiplier()
		{
			return null;
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
