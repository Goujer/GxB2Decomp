using System;

namespace Org.BouncyCastle.Asn1.X509
{
	public class AlgorithmIdentifier : Asn1Encodable
	{
		private readonly DerObjectIdentifier algorithm;

		private readonly Asn1Encodable parameters;

		public virtual DerObjectIdentifier Algorithm
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public virtual DerObjectIdentifier ObjectID
		{
			get
			{
				return null;
			}
		}

		public virtual Asn1Encodable Parameters
		{
			get
			{
				return null;
			}
		}

		public AlgorithmIdentifier(DerObjectIdentifier algorithm)
		{
		}

		[Obsolete]
		public AlgorithmIdentifier(string algorithm)
		{
		}

		public AlgorithmIdentifier(DerObjectIdentifier algorithm, Asn1Encodable parameters)
		{
		}

		internal AlgorithmIdentifier(Asn1Sequence seq)
		{
		}

		public static AlgorithmIdentifier GetInstance(Asn1TaggedObject obj, bool explicitly)
		{
			return null;
		}

		public static AlgorithmIdentifier GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
