using Org.BouncyCastle.Math;

namespace Org.BouncyCastle.Asn1.X509
{
	public class BasicConstraints : Asn1Encodable
	{
		private readonly DerBoolean cA;

		private readonly DerInteger pathLenConstraint;

		public BigInteger PathLenConstraint
		{
			get
			{
				return null;
			}
		}

		private BasicConstraints(Asn1Sequence seq)
		{
		}

		public BasicConstraints(bool cA)
		{
		}

		public BasicConstraints(int pathLenConstraint)
		{
		}

		public static BasicConstraints GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static BasicConstraints GetInstance(object obj)
		{
			return null;
		}

		public bool IsCA()
		{
			return false;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}
	}
}
