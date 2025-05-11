using System;
using System.Collections;

namespace Org.BouncyCastle.Math.EC
{
	public abstract class ECPoint
	{
		protected static ECFieldElement[] EMPTY_ZS;

		protected internal readonly ECCurve m_curve;

		protected internal readonly ECFieldElement m_x;

		protected internal readonly ECFieldElement m_y;

		protected internal readonly ECFieldElement[] m_zs;

		protected internal readonly bool m_withCompression;

		protected internal IDictionary m_preCompTable;

		public virtual ECCurve Curve
		{
			get
			{
				return null;
			}
		}

		protected virtual int CurveCoordinateSystem
		{
			get
			{
				return 0;
			}
		}

		[Obsolete]
		public virtual ECFieldElement X
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public virtual ECFieldElement Y
		{
			get
			{
				return null;
			}
		}

		public virtual ECFieldElement AffineXCoord
		{
			get
			{
				return null;
			}
		}

		public virtual ECFieldElement AffineYCoord
		{
			get
			{
				return null;
			}
		}

		public virtual ECFieldElement XCoord
		{
			get
			{
				return null;
			}
		}

		public virtual ECFieldElement YCoord
		{
			get
			{
				return null;
			}
		}

		protected internal ECFieldElement RawXCoord
		{
			get
			{
				return null;
			}
		}

		protected internal ECFieldElement RawYCoord
		{
			get
			{
				return null;
			}
		}

		protected internal ECFieldElement[] RawZCoords
		{
			get
			{
				return null;
			}
		}

		public bool IsInfinity
		{
			get
			{
				return false;
			}
		}

		public bool IsCompressed
		{
			get
			{
				return false;
			}
		}

		protected internal abstract bool CompressionYTilde { get; }

		protected ECPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
		{
		}

		internal ECPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
		{
		}

		protected static ECFieldElement[] GetInitialZCoords(ECCurve curve)
		{
			return null;
		}

		protected internal bool SatisfiesCofactor()
		{
			return false;
		}

		protected abstract bool SatisfiesCurveEquation();

		public ECPoint GetDetachedPoint()
		{
			return null;
		}

		protected abstract ECPoint Detach();

		public virtual ECFieldElement GetZCoord(int index)
		{
			return null;
		}

		public virtual ECFieldElement[] GetZCoords()
		{
			return null;
		}

		protected virtual void CheckNormalized()
		{
		}

		public virtual bool IsNormalized()
		{
			return false;
		}

		public virtual ECPoint Normalize()
		{
			return null;
		}

		internal virtual ECPoint Normalize(ECFieldElement zInv)
		{
			return null;
		}

		protected virtual ECPoint CreateScaledPoint(ECFieldElement sx, ECFieldElement sy)
		{
			return null;
		}

		public bool IsValid()
		{
			return false;
		}

		public virtual ECPoint ScaleX(ECFieldElement scale)
		{
			return null;
		}

		public virtual ECPoint ScaleY(ECFieldElement scale)
		{
			return null;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public virtual bool Equals(ECPoint other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		public override string ToString()
		{
			return null;
		}

		public virtual byte[] GetEncoded()
		{
			return null;
		}

		public abstract byte[] GetEncoded(bool compressed);

		public abstract ECPoint Add(ECPoint b);

		public abstract ECPoint Subtract(ECPoint b);

		public abstract ECPoint Negate();

		public virtual ECPoint TimesPow2(int e)
		{
			return null;
		}

		public abstract ECPoint Twice();

		public abstract ECPoint Multiply(BigInteger b);

		public virtual ECPoint TwicePlus(ECPoint b)
		{
			return null;
		}

		public virtual ECPoint ThreeTimes()
		{
			return null;
		}
	}
}
