using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class Chacha20Poly1305 : TlsCipher
	{
		private static readonly byte[] Zeroes;

		protected readonly TlsContext context;

		protected readonly ChaCha7539Engine encryptCipher;

		protected readonly ChaCha7539Engine decryptCipher;

		protected readonly byte[] encryptIV;

		protected readonly byte[] decryptIV;

		public Chacha20Poly1305(TlsContext context)
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

		protected virtual KeyParameter InitRecord(IStreamCipher cipher, bool forEncryption, long seqNo, byte[] iv)
		{
			return null;
		}

		protected virtual byte[] CalculateNonce(long seqNo, byte[] iv)
		{
			return null;
		}

		protected virtual KeyParameter GenerateRecordMacKey(IStreamCipher cipher)
		{
			return null;
		}

		protected virtual byte[] CalculateRecordMac(KeyParameter macKey, byte[] additionalData, byte[] buf, int off, int len)
		{
			return null;
		}

		protected virtual void UpdateRecordMacLength(IMac mac, int len)
		{
		}

		protected virtual void UpdateRecordMacText(IMac mac, byte[] buf, int off, int len)
		{
		}

		protected virtual byte[] GetAdditionalData(long seqNo, byte type, int len)
		{
			return null;
		}
	}
}
