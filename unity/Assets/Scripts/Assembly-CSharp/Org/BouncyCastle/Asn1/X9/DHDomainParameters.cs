using System.Collections;

namespace Org.BouncyCastle.Asn1.X9
{
	public class DHDomainParameters : Asn1Encodable
	{
		private readonly DerInteger p;

		private readonly DerInteger g;

		private readonly DerInteger q;

		private readonly DerInteger j;

		private readonly DHValidationParms validationParms;

		public DerInteger P
		{
			get
			{
				return null;
			}
		}

		public DerInteger G
		{
			get
			{
				return null;
			}
		}

		public DerInteger Q
		{
			get
			{
				return null;
			}
		}

		public DerInteger J
		{
			get
			{
				return null;
			}
		}

		public DHValidationParms ValidationParms
		{
			get
			{
				return null;
			}
		}

		public DHDomainParameters(DerInteger p, DerInteger g, DerInteger q, DerInteger j, DHValidationParms validationParms)
		{
		}

		private DHDomainParameters(Asn1Sequence seq)
		{
		}

		public static DHDomainParameters GetInstance(Asn1TaggedObject obj, bool isExplicit)
		{
			return null;
		}

		public static DHDomainParameters GetInstance(object obj)
		{
			return null;
		}

		private static Asn1Encodable GetNext(IEnumerator e)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
