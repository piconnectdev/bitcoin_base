import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:test/test.dart';

/// https://github.com/bitcoin/bips/blob/master/bip-0371.mediawiki
void main() {
  group("BIP-0371", () {
    _testInvalid();
    _test();
  });
}

void _test() {
  test("bitcoin core finalized", () {
    const psbt =
        "cHNidP8BAP1cAQIAAAADxj8RdgFDtzDdfcqV1X98hO9kw5mmvprH+e40YpDERPcBAAAAAP3///861gKrCF1XQNU4kqbrqrmcLtU+Rigur+DR7xZbB0RatgEAAAAA/f///+yk8o8uR7yO28jNGwL6PPKutFOAYxJcNIMlqpD60i7DAQAAAAD9////BaCGAQAAAAAAIlEgimPuBhhCdQYrO4ZqEMQAzie6Qb3B13C/ueX4Ke2JzvcQJwAAAAAAACJRINw2pKJpPBvZ7/LceBDMjmc8c+wXdXAYpgOr+NFM8PKyECcAAAAAAAAiUSCNo28bw7B4Kk888EYwO0UPs2x6rCOtsRD+zOnuO6y48WZMAAAAAAAAIlEgZV6YZttlyJcTy0AAdbeNRNw7cVV8d7rlfJcH9aV8bdkQJwAAAAAAACJRIKLnidPDMiEbvroZh8qKrC2okpW77ZSJEUy/oeOOG7piAAAAAAABAHICAAAAAc7QqtnT2PYCJuOTOKhdefBErI+0rAKee5UAny1QQfZhAAAAAAD9////Aoa4cakdAAAAFgAUe0WEM9DAQyNCbviDZb1M/vFBrHVQwwAAAAAAABepFDMIZjlVPdB+lcAKr5IIatD0Dzd/hwAAAAABASBQwwAAAAAAABepFDMIZjlVPdB+lcAKr5IIatD0Dzd/hwEHFxYAFAHfjFcErFRhkgBrBxy95xMdV/GQAQhrAkcwRAIgObHjIugt09KnDA5D+l8+CUpTJxfd0cZPAR3SB8eNe6YCIF+5y6EIre5LEaN5T/1628yHxjiwfyl0pVJk+laaYf3yASECsNWM0bPsBEw+xVx6PS1LXdmv1yAe7p12SbCFaLoqsZUAAQBxAgAAAAHspPKPLke8jtvIzRsC+jzyrrRTgGMSXDSDJaqQ+tIuwwAAAAAA/f///wLg02OMFQAAABYAFHtFhDPQwEMjQm74g2W9TP7xQax1UMMAAAAAAAAWABTB00kCgBw+2HOJJst8mxIBH39qUgAAAAABAR9QwwAAAAAAABYAFMHTSQKAHD7Yc4kmy3ybEgEff2pSAQhrAkcwRAIgAvxb0XMjUWCtbuxY8MTCVvALk2DpRNZZO+ycrYmdTJsCIAdSyU5KpevQlW0pVl9523qDNTgz0xPozFjhwHyfre/0ASECpEHEHK86mziovdiDhJs5SSZZrx++e6KmR4OpBoG+snUAAQB9AgAAAAHUDN3g+ar6PY49uD2a/bTT2bF0QNkT4VBVtC7fZPPi9QAAAAAA/f///wJHs2SMFQAAABYAFHtFhDPQwEMjQm74g2W9TP7xQax1UMMAAAAAAAAiUSAqfxYJr8XN5TOxjQ75w4zmgk1V6vbfri9RTJAwxjN16QAAAAABAStQwwAAAAAAACJRICp/Fgmvxc3lM7GNDvnDjOaCTVXq9t+uL1FMkDDGM3XpAQhCAUAS8C+joMO9vNmwaHlqCUwP8gqOoBNJJ1oOIs1Qg6ctYeAqX+1doY7I6YeEAnHkdfNy8qzzxTb9MXhVFwxLAZ2QAAAAAAEFIDuFiGvpC3V86Up593ypycPH3pXB44VBqp0r2RPmktzlIQc7hYhr6Qt1fOlKefd8qcnDx96VweOFQaqdK9kT5pLc5RkAkCKrPVYAAIABAACAAAAAgAEAAAAAAAAAAAA=";

    final builer = PsbtBuilder.fromBase64(
        "cHNidP8BAP1cAQIAAAADxj8RdgFDtzDdfcqV1X98hO9kw5mmvprH+e40YpDERPcBAAAAAP3///861gKrCF1XQNU4kqbrqrmcLtU+Rigur+DR7xZbB0RatgEAAAAA/f///+yk8o8uR7yO28jNGwL6PPKutFOAYxJcNIMlqpD60i7DAQAAAAD9////BaCGAQAAAAAAIlEgimPuBhhCdQYrO4ZqEMQAzie6Qb3B13C/ueX4Ke2JzvcQJwAAAAAAACJRINw2pKJpPBvZ7/LceBDMjmc8c+wXdXAYpgOr+NFM8PKyECcAAAAAAAAiUSCNo28bw7B4Kk888EYwO0UPs2x6rCOtsRD+zOnuO6y48WZMAAAAAAAAIlEgZV6YZttlyJcTy0AAdbeNRNw7cVV8d7rlfJcH9aV8bdkQJwAAAAAAACJRIKLnidPDMiEbvroZh8qKrC2okpW77ZSJEUy/oeOOG7piAAAAAAABAHICAAAAAc7QqtnT2PYCJuOTOKhdefBErI+0rAKee5UAny1QQfZhAAAAAAD9////Aoa4cakdAAAAFgAUe0WEM9DAQyNCbviDZb1M/vFBrHVQwwAAAAAAABepFDMIZjlVPdB+lcAKr5IIatD0Dzd/hwAAAAABASBQwwAAAAAAABepFDMIZjlVPdB+lcAKr5IIatD0Dzd/hwEHFxYAFAHfjFcErFRhkgBrBxy95xMdV/GQAQhrAkcwRAIgObHjIugt09KnDA5D+l8+CUpTJxfd0cZPAR3SB8eNe6YCIF+5y6EIre5LEaN5T/1628yHxjiwfyl0pVJk+laaYf3yASECsNWM0bPsBEw+xVx6PS1LXdmv1yAe7p12SbCFaLoqsZUAAQBxAgAAAAHspPKPLke8jtvIzRsC+jzyrrRTgGMSXDSDJaqQ+tIuwwAAAAAA/f///wLg02OMFQAAABYAFHtFhDPQwEMjQm74g2W9TP7xQax1UMMAAAAAAAAWABTB00kCgBw+2HOJJst8mxIBH39qUgAAAAABAR9QwwAAAAAAABYAFMHTSQKAHD7Yc4kmy3ybEgEff2pSAQhrAkcwRAIgAvxb0XMjUWCtbuxY8MTCVvALk2DpRNZZO+ycrYmdTJsCIAdSyU5KpevQlW0pVl9523qDNTgz0xPozFjhwHyfre/0ASECpEHEHK86mziovdiDhJs5SSZZrx++e6KmR4OpBoG+snUAAQB9AgAAAAHUDN3g+ar6PY49uD2a/bTT2bF0QNkT4VBVtC7fZPPi9QAAAAAA/f///wJHs2SMFQAAABYAFHtFhDPQwEMjQm74g2W9TP7xQax1UMMAAAAAAAAiUSAqfxYJr8XN5TOxjQ75w4zmgk1V6vbfri9RTJAwxjN16QAAAAABAStQwwAAAAAAACJRICp/Fgmvxc3lM7GNDvnDjOaCTVXq9t+uL1FMkDDGM3XpAQhCAUAS8C+joMO9vNmwaHlqCUwP8gqOoBNJJ1oOIs1Qg6ctYeAqX+1doY7I6YeEAnHkdfNy8qzzxTb9MXhVFwxLAZ2QAAAAAAEFIDuFiGvpC3V86Up593ypycPH3pXB44VBqp0r2RPmktzlIQc7hYhr6Qt1fOlKefd8qcnDx96VweOFQaqdK9kT5pLc5RkAkCKrPVYAAIABAACAAAAAgAEAAAAAAAAAAAA=");
    expect(psbt, builer.toBase64());
  });
  test(
      "Case: PSBT with one P2TR key only input with internal key and its derivation path",
      () {
    const psbtData =
        "70736274ff010052020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff0148e6052a01000000160014768e1eeb4cf420866033f80aceff0f9720744969000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a07572116fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2321900772b2da75600008001000080000000800100000000000000011720fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa232002202036b772a6db74d8753c98a827958de6c78ab3312109f37d3e0304484242ece73d818772b2da7540000800100008000000080000000000000000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });
  test(
      "Case: PSBT with one P2TR key only input with internal key, its derivation path, and signature",
      () {
    const psbtData =
        "70736274ff010052020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff0148e6052a01000000160014768e1eeb4cf420866033f80aceff0f9720744969000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a0757011340bb53ec917bad9d906af1ba87181c48b86ace5aae2b53605a725ca74625631476fc6f5baedaf4f2ee0f477f36f58f3970d5b8273b7e497b97af2e3f125c97af342116fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2321900772b2da75600008001000080000000800100000000000000011720fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa232002202036b772a6db74d8753c98a827958de6c78ab3312109f37d3e0304484242ece73d818772b2da7540000800100008000000080000000000000000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });

  test(
      "Case: PSBT with one P2TR key only output with internal key and its derivation path",
      () {
    const psbtData =
        "70736274ff01005e020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff0148e6052a0100000022512083698e458c6664e1595d75da2597de1e22ee97d798e706c4c0a4b5a9823cd743000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a07572116fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2321900772b2da75600008001000080000000800100000000000000011720fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa232000105201124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e67121071124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e6711900772b2da7560000800100008000000080000000000500000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });

  test(
      "Case: PSBT with one P2TR script path only input with dummy internal key, scripts, derivation paths for keys in the scripts, and merkle root",
      () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a0100000022512083698e458c6664e1595d75da2597de1e22ee97d798e706c4c0a4b5a9823cd743000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b6926215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac06f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f823202cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2acc04215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac097c6e6fea5ff714ff5724499990810e406e98aa10f5bf7e5f6784bc1d0a9a6ce23204320b0bf16f011b53ea7be615924aa7f27e5d29ad20ea1155d848676c3bad1b2acc06215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac0cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b09115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f82320fa0f7a3cef3b1d0c0a6ce7d26e17ada0b2e5c92d19efad48b41859cb8a451ca9acc021162cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d23901cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b09772b2da7560000800100008002000080000000000000000021164320b0bf16f011b53ea7be615924aa7f27e5d29ad20ea1155d848676c3bad1b23901115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f8772b2da75600008001000080010000800000000000000000211650929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac005007c461e5d2116fa0f7a3cef3b1d0c0a6ce7d26e17ada0b2e5c92d19efad48b41859cb8a451ca939016f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970772b2da7560000800100008003000080000000000000000001172050929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac0011820f0362e2f75a6f420a5bde3eb221d96ae6720cf25f81890c95b1d775acb515e65000105201124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e67121071124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e6711900772b2da7560000800100008000000080000000000500000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });
  test(
      "Case: PSBT with one P2TR script path only output with dummy internal key, taproot tree, and script key derivation paths",
      () {
    const psbtData =
        "70736274ff01005e020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff0148e6052a010000002251200a8cbdc86de1ce1c0f9caeb22d6df7ced3683fe423e05d1e402a879341d6f6f5000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a07572116fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2321900772b2da75600008001000080000000800100000000000000011720fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2320001052050929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac001066f02c02220736e572900fe1252589a2143c8f3c79f71a0412d2353af755e9701c782694a02ac02c02220631c5f3b5832b8fbdebfb19704ceeb323c21f40f7a24f43d68ef0cc26b125969ac01c0222044faa49a0338de488c8dfffecdfb6f329f380bd566ef20c8df6d813eab1c4273ac210744faa49a0338de488c8dfffecdfb6f329f380bd566ef20c8df6d813eab1c42733901f06b798b92a10ed9a9d0bbfd3af173a53b1617da3a4159ca008216cd856b2e0e772b2da75600008001000080010000800000000003000000210750929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac005007c461e5d2107631c5f3b5832b8fbdebfb19704ceeb323c21f40f7a24f43d68ef0cc26b125969390118ace409889785e0ea70ceebb8e1ca892a7a78eaede0f2e296cf435961a8f4ca772b2da756000080010000800200008000000000030000002107736e572900fe1252589a2143c8f3c79f71a0412d2353af755e9701c782694a02390129a5b4915090162d759afd3fe0f93fa3326056d0b4088cb933cae7826cb8d82c772b2da7560000800100008003000080000000000300000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });
  test(
      "Case: PSBT with one P2TR script path only input with dummy internal key, scripts, script key derivation paths, merkle root, and script path",
      () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a0100000022512083698e458c6664e1595d75da2597de1e22ee97d798e706c4c0a4b5a9823cd743000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b69241142cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b0940bf818d9757d6ffeb538ba057fb4c1fc4e0f5ef186e765beb564791e02af5fd3d5e2551d4e34e33d86f276b82c99c79aed3f0395a081efcd2cc2c65dd7e693d7941144320b0bf16f011b53ea7be615924aa7f27e5d29ad20ea1155d848676c3bad1b2115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f840e1f1ab6fabfa26b236f21833719dc1d428ab768d80f91f9988d8abef47bfb863bb1f2a529f768c15f00ce34ec283cdc07e88f8428be28f6ef64043c32911811a4114fa0f7a3cef3b1d0c0a6ce7d26e17ada0b2e5c92d19efad48b41859cb8a451ca96f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae97040ec1f0379206461c83342285423326708ab031f0da4a253ee45aafa5b8c92034d8b605490f8cd13e00f989989b97e215faa36f12dee3693d2daccf3781c1757f66215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac06f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f823202cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2acc04215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac097c6e6fea5ff714ff5724499990810e406e98aa10f5bf7e5f6784bc1d0a9a6ce23204320b0bf16f011b53ea7be615924aa7f27e5d29ad20ea1155d848676c3bad1b2acc06215c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac0cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b09115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f82320fa0f7a3cef3b1d0c0a6ce7d26e17ada0b2e5c92d19efad48b41859cb8a451ca9acc021162cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d23901cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b09772b2da7560000800100008002000080000000000000000021164320b0bf16f011b53ea7be615924aa7f27e5d29ad20ea1155d848676c3bad1b23901115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f8772b2da75600008001000080010000800000000000000000211650929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac005007c461e5d2116fa0f7a3cef3b1d0c0a6ce7d26e17ada0b2e5c92d19efad48b41859cb8a451ca939016f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970772b2da7560000800100008003000080000000000000000001172050929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac0011820f0362e2f75a6f420a5bde3eb221d96ae6720cf25f81890c95b1d775acb515e65000105201124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e67121071124da7aec92ccd06c954562647f437b138b95721a84be2bf2276bbddab3e6711900772b2da7560000800100008000000080000000000500000000";
    final psbt = Psbt.deserialize(BytesUtils.fromHexString(psbtData));
    expect(psbt.toHex(), psbtData);
  });
}

void _testInvalid() {
  test(
      "Case: PSBT With PSBT_IN_TAP_LEAF_SCRIPT Control block that is too short",
      () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a01000000225120030da4fce4f7db28c2cb2951631e003713856597fe963882cb500e68112cca63000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b6926115c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac06f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e123202cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2acc00000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having((p) => p.message,
            'error message', contains('Invalid PSBT Taproot Leaf Script'))));
  });
  test("Case: PSBT With PSBT_IN_TAP_LEAF_SCRIPT Control block that is too long",
      () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a01000000225120030da4fce4f7db28c2cb2951631e003713856597fe963882cb500e68112cca63000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b6926315c150929b74c1a04954b78b4b6035e97a5e078a5a0f28ec96d547bfee9ace803ac06f7d62059e9497a1a4a267569d9876da60101aff38e3529b9b939ce7f91ae970115f2e490af7cc45c4f78511f36057ce5c5a5c56325a29fb44dfc203f356e1f80023202cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2acc00000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having((p) => p.message,
            'error message', contains('Invalid PSBT Taproot Leaf Script'))));
  });
  test("Case: PSBT With PSBT_IN_TAP_SCRIPT_SIG signature that is too long", () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a01000000225120030da4fce4f7db28c2cb2951631e003713856597fe963882cb500e68112cca63000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b69241142cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b094289756aa3739ccc689ec0fcf3a360be32cc0b59b16e93a1e8bb4605726b2ca7a3ff706c4176649632b2cc68e1f912b8a578e3719ce7710885c7a966f49bcd43cb01010000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having(
            (p) => p.message,
            'error message',
            contains('Invalid PSBT Taproot Script Spend Signature'))));
  });
  test(
      "Case: PSBT With PSBT_IN_TAP_SCRIPT_SIG key that is too long (incorrectly serialized as compressed DER)",
      () {
    const psbtData =
        "70736274ff01005e02000000019bd48765230bf9a72e662001f972556e54f0c6f97feb56bcb5600d817f6995260100000000ffffffff0148e6052a01000000225120030da4fce4f7db28c2cb2951631e003713856597fe963882cb500e68112cca63000000000001012b00f2052a01000000225120c2247efbfd92ac47f6f40b8d42d169175a19fa9fa10e4a25d7f35eb4dd85b6924214022cb13ac68248de806aa6a3659cf3c03eb6821d09c8114a4e868febde865bb6d2cd970e15f53fc0c82f950fd560ffa919b76172be017368a89913af074f400b094089756aa3739ccc689ec0fcf3a360be32cc0b59b16e93a1e8bb4605726b2ca7a3ff706c4176649632b2cc68e1f912b8a578e3719ce7710885c7a966f49bcd43cb0000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having(
            (p) => p.message,
            'error message',
            contains('Invalid PSBT Taproot Script Spend Signature'))));
  });
  test(
      "Case: PSBT With PSBT_OUT_TAP_INTERNAL_KEY key that is too long (incorrectly serialized as compressed DER)",
      () {
    const psbtData =
        "70736274ff01007d020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff02887b0100000000001600142382871c7e8421a00093f754d91281e675874b9f606b042a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a0757000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a0757000001052102fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa23200";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having((p) => p.message,
            'error message', contains('Invalid PSBT Taproot Internal Key'))));
  });
  test(
      "Case: PSBT With PSBT_IN_TAP_BIP32_DERIVATION key that is too long (incorrectly serialized as compressed DER)",
      () {
    const psbtData =
        "70736274ff010071020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff02787c01000000000016001483a7e34bd99ff03a4962ef8a1a101bb295461ece606b042a010000001600147ac369df1b20e033d6116623957b0ac49f3c52e8000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a0757221602fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa2321900772b2da75600008001000080000000800100000000000000000000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having(
            (p) => p.message,
            'error message',
            contains('Invalid Taproot Key BIP 32 Derivation Path'))));
  });
  test("Case: PSBT With PSBT_KEY_PATH_SIG signature that is too long", () {
    const psbtData =
        "70736274ff010071020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff02787c01000000000016001483a7e34bd99ff03a4962ef8a1a101bb295461ece606b042a010000001600147ac369df1b20e033d6116623957b0ac49f3c52e8000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a0757011342173bb3d36c074afb716fec6307a069a2e450b995f3c82785945ab8df0e24260dcd703b0cbf34de399184a9481ac2b3586db6601f026a77f7e4938481bc34751701aa000000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having(
            (p) => p.message,
            'error message',
            contains('Invalid PSBT Taproot Key Spend Signature'))));
  });
  test("Case: PSBT With PSBT_KEY_PATH_SIG signature that is too short", () {
    const psbtData =
        "70736274ff010071020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff02787c01000000000016001483a7e34bd99ff03a4962ef8a1a101bb295461ece606b042a010000001600147ac369df1b20e033d6116623957b0ac49f3c52e8000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a075701133f173bb3d36c074afb716fec6307a069a2e450b995f3c82785945ab8df0e24260dcd703b0cbf34de399184a9481ac2b3586db6601f026a77f7e4938481bc3475000000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having(
            (p) => p.message,
            'error message',
            contains('Invalid PSBT Taproot Key Spend Signature'))));
  });
  test(
      "Case: PSBT With PSBT_IN_TAP_INTERNAL_KEY key that is too long (incorrectly serialized as compressed DER)",
      () {
    const psbtData =
        "70736274ff010071020000000127744ababf3027fe0d6cf23a96eee2efb188ef52301954585883e69b6624b2420000000000ffffffff02787c01000000000016001483a7e34bd99ff03a4962ef8a1a101bb295461ece606b042a010000001600147ac369df1b20e033d6116623957b0ac49f3c52e8000000000001012b00f2052a010000002251205a2c2cf5b52cf31f83ad2e8da63ff03183ecd8f609c7510ae8a48e03910a075701172102fe349064c98d6e2a853fa3c9b12bd8b304a19c195c60efa7ee2393046d3fa232000000";
    expect(
        () => Psbt.fromHex(psbtData),
        throwsA(isA<DartBitcoinPluginException>().having((p) => p.message,
            'error message', contains('Invalid PSBT Taproot Internal Key'))));
  });
}
