using System;

namespace Org.BouncyCastle.Math.EC
{
	public class F2mPoint : AbstractF2mPoint
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

		public F2mPoint(ECCurve curve, ECFieldElement x, ECFieldElement y)
			: base(null, null, null, false)
		{
		}

		public F2mPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, bool withCompression)
			: base(null, null, null, false)
		{
		}

		internal F2mPoint(ECCurve curve, ECFieldElement x, ECFieldElement y, ECFieldElement[] zs, bool withCompression)
			: base(null, null, null, false)
		{
		}

		[Obsolete]
		public F2mPoint(ECCurve curve)
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
