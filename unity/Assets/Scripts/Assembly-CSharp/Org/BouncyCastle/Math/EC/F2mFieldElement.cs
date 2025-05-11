namespace Org.BouncyCastle.Math.EC
{
	public class F2mFieldElement : ECFieldElement
	{
		public const int Gnb = 1;

		public const int Tpb = 2;

		public const int Ppb = 3;

		private int representation;

		private int m;

		private int[] ks;

		private LongArray x;

		public override int BitLength
		{
			get
			{
				return 0;
			}
		}

		public override bool IsOne
		{
			get
			{
				return false;
			}
		}

		public override bool IsZero
		{
			get
			{
				return false;
			}
		}

		public override string FieldName
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

		public int Representation
		{
			get
			{
				return 0;
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

		public F2mFieldElement(int m, int k1, int k2, int k3, BigInteger x)
		{
		}

		public F2mFieldElement(int m, int k, BigInteger x)
		{
		}

		private F2mFieldElement(int m, int[] ks, LongArray x)
		{
		}

		public override bool TestBitZero()
		{
			return false;
		}

		public override BigInteger ToBigInteger()
		{
			return null;
		}

		public static void CheckFieldElements(ECFieldElement a, ECFieldElement b)
		{
		}

		public override ECFieldElement Add(ECFieldElement b)
		{
			return null;
		}

		public override ECFieldElement AddOne()
		{
			return null;
		}

		public override ECFieldElement Subtract(ECFieldElement b)
		{
			return null;
		}

		public override ECFieldElement Multiply(ECFieldElement b)
		{
			return null;
		}

		public override ECFieldElement MultiplyMinusProduct(ECFieldElement b, ECFieldElement x, ECFieldElement y)
		{
			return null;
		}

		public override ECFieldElement MultiplyPlusProduct(ECFieldElement b, ECFieldElement x, ECFieldElement y)
		{
			return null;
		}

		public override ECFieldElement Divide(ECFieldElement b)
		{
			return null;
		}

		public override ECFieldElement Negate()
		{
			return null;
		}

		public override ECFieldElement Square()
		{
			return null;
		}

		public override ECFieldElement SquareMinusProduct(ECFieldElement x, ECFieldElement y)
		{
			return null;
		}

		public override ECFieldElement SquarePlusProduct(ECFieldElement x, ECFieldElement y)
		{
			return null;
		}

		public override ECFieldElement SquarePow(int pow)
		{
			return null;
		}

		public override ECFieldElement Invert()
		{
			return null;
		}

		public override ECFieldElement Sqrt()
		{
			return null;
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public virtual bool Equals(F2mFieldElement other)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}
	}
}
