using Org.BouncyCastle.Asn1.X509;

namespace Org.BouncyCastle.Asn1.Pkcs
{
	public class RsassaPssParameters : Asn1Encodable
	{
		private AlgorithmIdentifier hashAlgorithm;

		private AlgorithmIdentifier maskGenAlgorithm;

		private DerInteger saltLength;

		private DerInteger trailerField;

		public static readonly AlgorithmIdentifier DefaultHashAlgorithm;

		public static readonly AlgorithmIdentifier DefaultMaskGenFunction;

		public static readonly DerInteger DefaultSaltLength;

		public static readonly DerInteger DefaultTrailerField;

		public AlgorithmIdentifier HashAlgorithm
		{
			get
			{
				return null;
			}
		}

		public AlgorithmIdentifier MaskGenAlgorithm
		{
			get
			{
				return null;
			}
		}

		public DerInteger SaltLength
		{
			get
			{
				return null;
			}
		}

		public DerInteger TrailerField
		{
			get
			{
				return null;
			}
		}

		public RsassaPssParameters()
		{
		}

		public RsassaPssParameters(AlgorithmIdentifier hashAlgorithm, AlgorithmIdentifier maskGenAlgorithm, DerInteger saltLength, DerInteger trailerField)
		{
		}

		public RsassaPssParameters(Asn1Sequence seq)
		{
		}

		public static RsassaPssParameters GetInstance(object obj)
		{
			return null;
		}

		public override Asn1Object ToAsn1Object()
		{
			return null;
		}
	}
}
