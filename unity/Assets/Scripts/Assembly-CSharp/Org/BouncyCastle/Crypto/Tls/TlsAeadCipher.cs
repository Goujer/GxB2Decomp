using Org.BouncyCastle.Crypto.Modes;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsAeadCipher : TlsCipher
	{
		public const int NONCE_RFC5288 = 1;

		internal const int NONCE_DRAFT_CHACHA20_POLY1305 = 2;

		protected readonly TlsContext context;

		protected readonly int macSize;

		protected readonly int record_iv_length;

		protected readonly IAeadBlockCipher encryptCipher;

		protected readonly IAeadBlockCipher decryptCipher;

		protected readonly byte[] encryptImplicitNonce;

		protected readonly byte[] decryptImplicitNonce;

		protected readonly int nonceMode;

		public TlsAeadCipher(TlsContext context, IAeadBlockCipher clientWriteCipher, IAeadBlockCipher serverWriteCipher, int cipherKeySize, int macSize)
		{
		}

		internal TlsAeadCipher(TlsContext context, IAeadBlockCipher clientWriteCipher, IAeadBlockCipher serverWriteCipher, int cipherKeySize, int macSize, int nonceMode)
		{
		}

		public virtual int GetPlaintextLimit(int ciphertextLimit)
		{
			return 0;
		}

		public virtual byte[] EncodePlaintext(long seqNo, byte type, byte[] plaintext, int offset, int len)
		{
			return null;
		}

		public virtual byte[] DecodeCiphertext(long seqNo, byte type, byte[] ciphertext, int offset, int len)
		{
			return null;
		}

		protected virtual byte[] GetAdditionalData(long seqNo, byte type, int len)
		{
			return null;
		}
	}
}
