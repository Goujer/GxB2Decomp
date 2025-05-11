using Org.BouncyCastle.Crypto.Modes;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class DefaultTlsCipherFactory : AbstractTlsCipherFactory
	{
		public override TlsCipher CreateCipher(TlsContext context, int encryptionAlgorithm, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsBlockCipher CreateAESCipher(TlsContext context, int cipherKeySize, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsBlockCipher CreateCamelliaCipher(TlsContext context, int cipherKeySize, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsCipher CreateChaCha20Poly1305(TlsContext context)
		{
			return null;
		}

		protected virtual TlsAeadCipher CreateCipher_Aes_Ccm(TlsContext context, int cipherKeySize, int macSize)
		{
			return null;
		}

		protected virtual TlsAeadCipher CreateCipher_Aes_Gcm(TlsContext context, int cipherKeySize, int macSize)
		{
			return null;
		}

		protected virtual TlsAeadCipher CreateCipher_Aes_Ocb(TlsContext context, int cipherKeySize, int macSize)
		{
			return null;
		}

		protected virtual TlsAeadCipher CreateCipher_Camellia_Gcm(TlsContext context, int cipherKeySize, int macSize)
		{
			return null;
		}

		protected virtual TlsBlockCipher CreateDesEdeCipher(TlsContext context, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsNullCipher CreateNullCipher(TlsContext context, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsStreamCipher CreateRC4Cipher(TlsContext context, int cipherKeySize, int macAlgorithm)
		{
			return null;
		}

		protected virtual TlsBlockCipher CreateSeedCipher(TlsContext context, int macAlgorithm)
		{
			return null;
		}

		protected virtual IBlockCipher CreateAesEngine()
		{
			return null;
		}

		protected virtual IBlockCipher CreateCamelliaEngine()
		{
			return null;
		}

		protected virtual IBlockCipher CreateAesBlockCipher()
		{
			return null;
		}

		protected virtual IAeadBlockCipher CreateAeadBlockCipher_Aes_Ccm()
		{
			return null;
		}

		protected virtual IAeadBlockCipher CreateAeadBlockCipher_Aes_Gcm()
		{
			return null;
		}

		protected virtual IAeadBlockCipher CreateAeadBlockCipher_Aes_Ocb()
		{
			return null;
		}

		protected virtual IAeadBlockCipher CreateAeadBlockCipher_Camellia_Gcm()
		{
			return null;
		}

		protected virtual IBlockCipher CreateCamelliaBlockCipher()
		{
			return null;
		}

		protected virtual IBlockCipher CreateDesEdeBlockCipher()
		{
			return null;
		}

		protected virtual IStreamCipher CreateRC4StreamCipher()
		{
			return null;
		}

		protected virtual IBlockCipher CreateSeedBlockCipher()
		{
			return null;
		}

		protected virtual IDigest CreateHMacDigest(int macAlgorithm)
		{
			return null;
		}
	}
}
