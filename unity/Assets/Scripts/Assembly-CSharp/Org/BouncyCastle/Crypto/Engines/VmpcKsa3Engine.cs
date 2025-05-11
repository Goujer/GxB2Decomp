namespace Org.BouncyCastle.Crypto.Engines
{
	public class VmpcKsa3Engine : VmpcEngine
	{
		public override string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		protected override void InitKey(byte[] keyBytes, byte[] ivBytes)
		{
		}
	}
}
