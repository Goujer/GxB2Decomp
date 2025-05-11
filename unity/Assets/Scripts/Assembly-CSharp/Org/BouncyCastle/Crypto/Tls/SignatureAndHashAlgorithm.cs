using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class SignatureAndHashAlgorithm
	{
		protected readonly byte mHash;

		protected readonly byte mSignature;

		public virtual byte Hash
		{
			get
			{
				return 0;
			}
		}

		public virtual byte Signature
		{
			get
			{
				return 0;
			}
		}

		public SignatureAndHashAlgorithm(byte hash, byte signature)
		{
		}

		public override bool Equals(object obj)
		{
			return false;
		}

		public override int GetHashCode()
		{
			return 0;
		}

		public virtual void Encode(Stream output)
		{
		}

		public static SignatureAndHashAlgorithm Parse(Stream input)
		{
			return null;
		}
	}
}
