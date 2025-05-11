using System;
using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Signers
{
	public class X931Signer : ISigner
	{
		[Obsolete]
		public const int TRAILER_IMPLICIT = 188;

		[Obsolete]
		public const int TRAILER_RIPEMD160 = 12748;

		[Obsolete]
		public const int TRAILER_RIPEMD128 = 13004;

		[Obsolete]
		public const int TRAILER_SHA1 = 13260;

		[Obsolete]
		public const int TRAILER_SHA256 = 13516;

		[Obsolete]
		public const int TRAILER_SHA512 = 13772;

		[Obsolete]
		public const int TRAILER_SHA384 = 14028;

		[Obsolete]
		public const int TRAILER_WHIRLPOOL = 14284;

		[Obsolete]
		public const int TRAILER_SHA224 = 14540;

		private IDigest digest;

		private IAsymmetricBlockCipher cipher;

		private RsaKeyParameters kParam;

		private int trailer;

		private int keyBits;

		private byte[] block;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public X931Signer(IAsymmetricBlockCipher cipher, IDigest digest, bool isImplicit)
		{
		}

		public X931Signer(IAsymmetricBlockCipher cipher, IDigest digest)
		{
		}

		public virtual void Init(bool forSigning, ICipherParameters parameters)
		{
		}

		private void ClearBlock(byte[] block)
		{
		}

		public virtual void Update(byte b)
		{
		}

		public virtual void BlockUpdate(byte[] input, int off, int len)
		{
		}

		public virtual void Reset()
		{
		}

		public virtual byte[] GenerateSignature()
		{
			return null;
		}

		private void CreateSignatureBlock()
		{
		}

		public virtual bool VerifySignature(byte[] signature)
		{
			return false;
		}
	}
}
