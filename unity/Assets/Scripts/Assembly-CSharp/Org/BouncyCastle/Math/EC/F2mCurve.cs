using System;
using Org.BouncyCastle.Math.EC.Multiplier;

namespace Org.BouncyCastle.Math.EC
{
	public class F2mCurve : AbstractF2mCurve
	{
		private const int F2M_DEFAULT_COORDS = 6;

		private readonly int m;

		private readonly int k1;

		private readonly int k2;

		private readonly int k3;

		protected readonly F2mPoint m_infinity;

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

		public int M
		{
			get
			{
				return 0;
			}
		}

		public int K1
		{
			get
			{
				return 0;
			}
		}

		public int K2
		{
			get
			{
				return 0;
			}
		}

		public int K3
		{
			get
			{
				return 0;
			}
		}

		[Obsolete]
		public BigInteger N
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public BigInteger H
		{
			get
			{
				return null;
			}
		}

		public F2mCurve(int m, int k, BigInteger a, BigInteger b)
			: base(0, 0, 0, 0)
		{
		}

		public F2mCurve(int m, int k, BigInteger a, BigInteger b, BigInteger order, BigInteger cofactor)
			: base(0, 0, 0, 0)
		{
		}

		public F2mCurve(int m, int k1, int k2, int k3, BigInteger a, BigInteger b)
			: base(0, 0, 0, 0)
		{
		}

		public F2mCurve(int m, int k1, int k2, int k3, BigInteger a, BigInteger b, BigInteger order, BigInteger cofactor)
			: base(0, 0, 0, 0)
		{
		}

		protected F2mCurve(int m, int k1, int k2, int k3, ECFieldElement a, ECFieldElement b, BigInteger order, BigInteger cofactor)
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

		public bool IsTrinomial()
		{
			return false;
		}
	}
}
