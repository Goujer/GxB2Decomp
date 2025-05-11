using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class DigitallySigned
	{
		protected readonly SignatureAndHashAlgorithm mAlgorithm;

		protected readonly byte[] mSignature;

		public virtual SignatureAndHashAlgorithm Algorithm
		{
			get
			{
				return null;
			}
		}

		public virtual byte[] Signature
		{
			get
			{
				return null;
			}
		}

		public DigitallySigned(SignatureAndHashAlgorithm algorithm, byte[] signature)
		{
		}

		public virtual void Encode(Stream output)
		{
		}

		public static DigitallySigned Parse(TlsContext context, Stream input)
		{
			return null;
		}
	}
}
